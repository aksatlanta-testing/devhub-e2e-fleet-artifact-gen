
{{- define "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.fullname" -}}
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


{{- define "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.labels" -}}
helm.sh/chart: {{ include "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.chart" . }}
{{ include "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeeb8bb0f-73e8-4814-912d-771a5ac62535.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}