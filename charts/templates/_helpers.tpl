
{{- define "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.fullname" -}}
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


{{- define "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.labels" -}}
helm.sh/chart: {{ include "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.chart" . }}
{{ include "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodcd7504f-b0dc-4651-98c8-4a132563738b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}