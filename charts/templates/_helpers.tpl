
{{- define "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.fullname" -}}
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


{{- define "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.labels" -}}
helm.sh/chart: {{ include "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.chart" . }}
{{ include "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod3cf520a-a398-43a8-9a05-4e8b0e5e7d9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}