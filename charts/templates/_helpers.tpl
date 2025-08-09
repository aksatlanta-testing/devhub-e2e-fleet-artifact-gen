
{{- define "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.fullname" -}}
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


{{- define "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.labels" -}}
helm.sh/chart: {{ include "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.chart" . }}
{{ include "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefc9047e-df9f-4d6a-9df3-b4d669119f04.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}