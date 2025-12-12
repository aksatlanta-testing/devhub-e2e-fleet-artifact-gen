
{{- define "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.fullname" -}}
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


{{- define "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.labels" -}}
helm.sh/chart: {{ include "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.chart" . }}
{{ include "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d096cdd-e476-47e8-9145-4912157ec03f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}