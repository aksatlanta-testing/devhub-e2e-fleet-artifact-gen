
{{- define "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.fullname" -}}
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


{{- define "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.labels" -}}
helm.sh/chart: {{ include "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.chart" . }}
{{ include "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2bf054bc-521e-4a35-ae89-266d5c2fd20b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}