
{{- define "go-echode6daac1-b24d-43ff-81bb-b56100c65255.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode6daac1-b24d-43ff-81bb-b56100c65255.fullname" -}}
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


{{- define "go-echode6daac1-b24d-43ff-81bb-b56100c65255.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode6daac1-b24d-43ff-81bb-b56100c65255.labels" -}}
helm.sh/chart: {{ include "go-echode6daac1-b24d-43ff-81bb-b56100c65255.chart" . }}
{{ include "go-echode6daac1-b24d-43ff-81bb-b56100c65255.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode6daac1-b24d-43ff-81bb-b56100c65255.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode6daac1-b24d-43ff-81bb-b56100c65255.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}