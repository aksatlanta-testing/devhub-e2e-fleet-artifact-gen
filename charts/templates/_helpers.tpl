
{{- define "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.fullname" -}}
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


{{- define "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.labels" -}}
helm.sh/chart: {{ include "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.chart" . }}
{{ include "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7fba11b7-d627-4bce-9ad4-b5bc5dc36b15.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}