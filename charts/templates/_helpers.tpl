
{{- define "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.labels" -}}
helm.sh/chart: {{ include "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.chart" . }}
{{ include "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeee59479-62d0-4fc2-ad2f-e12d2a532a0c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}