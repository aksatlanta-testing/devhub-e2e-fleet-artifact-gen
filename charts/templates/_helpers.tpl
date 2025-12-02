
{{- define "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.fullname" -}}
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


{{- define "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.labels" -}}
helm.sh/chart: {{ include "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.chart" . }}
{{ include "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod929a5c5-4f57-4988-9149-4ba388fc5bcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}