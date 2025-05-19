
{{- define "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.fullname" -}}
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


{{- define "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.labels" -}}
helm.sh/chart: {{ include "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.chart" . }}
{{ include "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoace09b4f-6bbf-485f-97fc-33e5a5e15f77.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}