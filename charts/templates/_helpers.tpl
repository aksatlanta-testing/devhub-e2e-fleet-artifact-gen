
{{- define "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.fullname" -}}
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


{{- define "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.labels" -}}
helm.sh/chart: {{ include "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.chart" . }}
{{ include "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1f7ea0d-9853-4e59-bc19-438cf8788aee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}