
{{- define "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.fullname" -}}
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


{{- define "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.labels" -}}
helm.sh/chart: {{ include "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.chart" . }}
{{ include "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoadf8383a-6d4d-4cba-ba17-e1ff6d784498.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}