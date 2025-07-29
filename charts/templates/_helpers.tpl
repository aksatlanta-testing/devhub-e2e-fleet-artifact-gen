
{{- define "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.fullname" -}}
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


{{- define "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.labels" -}}
helm.sh/chart: {{ include "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.chart" . }}
{{ include "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo52e1ff4c-b0d4-4746-80d4-982805f3088a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}