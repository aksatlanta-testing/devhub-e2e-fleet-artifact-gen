
{{- define "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.fullname" -}}
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


{{- define "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.labels" -}}
helm.sh/chart: {{ include "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.chart" . }}
{{ include "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5b68fa2-1114-45f0-a3cb-69973802fc2f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}