
{{- define "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.fullname" -}}
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


{{- define "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.labels" -}}
helm.sh/chart: {{ include "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.chart" . }}
{{ include "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo13016ac3-cd86-4646-9019-b1c9eeee0609.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}