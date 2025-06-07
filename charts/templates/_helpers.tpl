
{{- define "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.fullname" -}}
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


{{- define "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.labels" -}}
helm.sh/chart: {{ include "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.chart" . }}
{{ include "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0f7114b-d86f-4efc-88fd-491117619e86.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}