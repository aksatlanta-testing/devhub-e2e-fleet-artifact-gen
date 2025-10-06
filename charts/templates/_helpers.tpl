
{{- define "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.fullname" -}}
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


{{- define "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.labels" -}}
helm.sh/chart: {{ include "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.chart" . }}
{{ include "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd5d427f-435d-4d58-b1bb-61239fc964ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}