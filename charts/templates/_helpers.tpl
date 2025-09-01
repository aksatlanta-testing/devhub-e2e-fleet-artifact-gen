
{{- define "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.fullname" -}}
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


{{- define "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.labels" -}}
helm.sh/chart: {{ include "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.chart" . }}
{{ include "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5af949ae-6572-4745-9010-e000d9e0f4ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}